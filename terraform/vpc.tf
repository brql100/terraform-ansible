resource "aws_vpc" "main_vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "terraform-aws-vpc"
    }
}

resource "aws_eip" "nat" {
    instance = "${aws_instance.nat.id}"
    vpc = true
}

resource "aws_eip" "web-1" {
    instance = "${aws_instance.web-1.id}"
    vpc = true
}

resource "aws_route_table" "sa-east-1a-public" {
    vpc_id = "${aws_vpc.main_vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.ig-main.id}"
    }

    tags {
        Name = "Public Subnet"
    }
}

resource "aws_route_table_association" "sa-east-1a-public" {
    subnet_id = "${aws_subnet.sa-east-1a-public.id}"
    route_table_id = "${aws_route_table.sa-east-1a-public.id}"
}

resource "aws_route_table" "sa-east-1a-private" {
    vpc_id = "${aws_vpc.main_vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.nat.id}"
    }

    tags {
        Name = "Private Subnet"
    }
}

resource "aws_route_table_association" "sa-east-1a-private" {
    subnet_id = "${aws_subnet.sa-east-1a-private.id}"
    route_table_id = "${aws_route_table.sa-east-1a-private.id}"
}