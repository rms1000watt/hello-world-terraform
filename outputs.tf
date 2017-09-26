output "address" {
  value = "${aws_instance.test-ubuntu-01.dns_name}"
}
