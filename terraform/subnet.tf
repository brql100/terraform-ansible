resource "aws_subnet" "eu-west-1a-public" {
    vpc_id = "${aws_vpc.main_vpc.id}"

    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = "sa-east-1a"

    tags {
        Name = "Public Subnet"
    }
}

resource "aws_subnet" "sa-east-1a-private" {
    vpc_id = "${aws_vpc.main_vpc.id}"

    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "sa-east-1a"

    tags {
        Name = "Private Subnet"
    }
}