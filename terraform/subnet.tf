resource "aws_subnet" "eu-west-1a-public" {
    vpc_id = "${aws_vpc.main_vpc.id}"

    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = "eu-west-1a"

    tags {
        Name = "Public Subnet"
    }
}