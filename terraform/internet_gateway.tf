resource "aws_internet_gateway" "ig-main" {
    vpc_id = "${aws_vpc.main_vpc.id}"
}
