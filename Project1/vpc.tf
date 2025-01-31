#Create a VPC
resource  "aws_vpc" "vpc" {
    cidr_block= "10.0.0.0/16"
    tags={
        Name="terraform-vpc"
    }
}
#Create Public Subnet 
resource "aws_subnet" "public" {
    vpc_id=aws_vpc.vpc.id
    cidr_block="10.0.1.0/24"
    #The public subnet is configured to assign public IPs to instances automatically
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"
    tags={
        Name="public-subnet"
    }
}
#Create Private Subnet 
resource "aws_subnet" "private" {
    vpc_id=aws_vpc.vpc.id
    cidr_block="10.0.2.0/24"
    availability_zone = "us-east-1a"
    tags={
        Name="private-subnet"
    }
}
#Add an Internet Gateway 
#An internet gateway allows internet traffic to flow to resources in the public subnet
resource "aws_internet_gateway" "internet_gateway" {
    vpc_id=aws_vpc.vpc.id
    tags={
        Name="terraform-igw"
    }
}
#Add Route Table
resource "aws_route_table" "public"{
    vpc_id=aws_vpc.vpc.id
    route{
        cidr_block="0.0.0.0/0"
        gateway_id=aws_internet_gateway.internet_gateway.id
    }
}
resource "aws_route_table_association" "public" {
    subnet_id=aws_subnet.public.id
    route_table_id=aws_route_table.public.id
}
