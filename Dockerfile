FROM centos:7

#ADD fio-2.1.10-1.el7.rf.x86_64.rpm  .
#ADD	libaio-0.3.109-13.el7.x86_64.rpm .
#ADD libaio-devel-0.3.109-13.el7.x86_64.rpm .

RUN wget --no-check-certificate https://rpmfind.net/linux/centos/7.5.1804/os/x86_64/Packages/libaio-0.3.109-13.el7.x86_64.rpm \
	https://rpmfind.net/linux/centos/7.5.1804/os/x86_64/Packages/libaio-devel-0.3.109-13.el7.x86_64.rpm \
	https://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/f/fio-3.7-1.fc29.x86_64.rpm
	
ADD fio_test.sh .
RUN rpm -ivh libaio-0.3.109-13.el7.x86_64.rpm  \
	libaio-devel-0.3.109-13.el7.x86_64.rpm \
	fio-2.1.10-1.el7.rf.x86_64.rpm

ENTRYPOINT ["bash", "-c"]
CMD ["./fio_test.sh"]
