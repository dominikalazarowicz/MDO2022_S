text
keyboard --vckeymap=pl --xlayouts='pl'
lang pl_PL.UTF-8

%packages
@^server-product-envrionment
%end

firstboot --enable

ignoredisk --only-use=sda
autopart

clearpart --none --initlabel

timezone Europe/Warsaw --utc

rootpw --iscrypted $y$j9T$1Vkq9YSWjdCf8MiTN0WudBoM$KqIx7d/t.9Q/2jZ/tNBR5eM17Peifk3Wz.hZ3nVsHt5

 %post
 mkdir deploy
 cd deploy
 wget 192.168.0.169:8080/job/Lz4Main/lastSuccessfulBuild/artifact/l2beat_backend1.0.0.tar.gz
 tar -xzf l2beat4*.tar.gz
 %end