resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Allow SSH, HTTP, and Jenkins port"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # SSH
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Jenkins UI
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # HTTP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-sg"
  }
}

resource "aws_instance" "jenkins_server" {
  ami                         = "ami-0f918f7e67a3323f0" # Ubuntu 22.04 LTS (Mumbai)
  instance_type               = "t3.medium"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true # 👈 Required for public IP

  user_data = <<-EOF
              #!/bin/bash

              # Update packages
              apt update -y

              # Install Java (required for Jenkins)
              apt install -y openjdk-17-jdk

              # Add Jenkins key and repo
              curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
              echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

              # Update again and install Jenkins
              apt update -y
              apt install -y jenkins
              systemctl start jenkins
              systemctl enable jenkins

              # Install Docker
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker
              usermod -aG docker jenkins

              # Install Git and unzip
              apt install -y git unzip

              # Firewall setup
              ufw allow 8080
              ufw allow OpenSSH
              ufw --force enable
              EOF

  tags = {
    Name = "Jenkins-Server"
  }
}
