![landing](https://user-images.githubusercontent.com/80253983/159113895-5290944b-81a5-4d1a-ac0f-2520d8610fae.png)

## 개발환경
#### 📱 APP 📱
<img src="https://img.shields.io/badge/SwiftUI-F05138?style=flat-square&logo=Swift&logoColor=white"/> <img src="https://img.shields.io/badge/Apollo-311C87?style=flat-square&logo=ApolloGraphQL&logoColor=white"/> <img src="https://img.shields.io/badge/GraphQL-E10098?style=flat-square&logo=GraphQL&logoColor=white"/> 

#### 💻 WEB 💻
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=JavaScript&logoColor=white"/> <img src="https://img.shields.io/badge/SpringBoot-6DB33F?style=flat-square&logo=SpringBoot&logoColor=white"/> <img src="https://img.shields.io/badge/NGINX-009639?style=flat-square&logo=NGINX&logoColor=white"/> <img src="https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=Docker&logoColor=white"/> <img src="https://img.shields.io/badge/ApacheKafka-231F20?style=flat-square&logo=ApacheKafka&logoColor=white"/>
<img src="https://img.shields.io/badge/Grafana-F46800?style=flat-square&logo=Grafana&logoColor=white"/> 
<img src="https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=Prometheus&logoColor=white"/>
<img src="https://img.shields.io/badge/Selenium-43B02A?style=flat-square&logo=Selenium&logoColor=white"/>

#### 🛠 TOOL 🛠
<img src="https://img.shields.io/badge/Jenkins-D24939?style=flat-square&logo=Jenkins&logoColor=white"/> <img src="https://img.shields.io/badge/AmazonAWS-232F3E?style=flat-square&logo=AmazonAWS&logoColor=white"/> <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=MySQL&logoColor=white"/> <img src="https://img.shields.io/badge/Apache-D22128?style=flat-square&logo=Apache&logoColor=white"/>

<img src="https://img.shields.io/badge/Github-181717?style=flat-square&logo=Github&logoColor=white"/>


## Link
#### 📎 [Trello](https://trello.com/b/0S6KfZjD/caca)

#### 📎 [Apollo](https://studio.apollographql.com/org/clonet/graphs)

## Setting to Develop
### pre-commit.sample to pre-commit & input this
```
################################################ iOS
echo "precommit-start"
cd APP/Clonet
xcodebuild -workspace Clonet.xcworkspace -scheme ClonetUITests -destination 'platform=iOS Simulator,OS=15.2,name=iPad (9th generation)' test

echo "precommit-finish"
################################################

################################################ WEB

cd ../../WEB/selenium/
node test.js

################################################
```


## To Run
```
cd Terraform
terraform init
// terraform import aws_instance.app_server i-07~
terraform plan
terraform apply

sudo systemctl start docker
docker network create --gateway 172.18.0.1 --subnet 172.18.0.0/16 clonet_network 
sudo docker-compose up --build -d
```
### Don't run
```
terraform destroy
```

## Email
* pavi03@kpu.ac.kr
* pjy0619@kpu.ac.kr
* petitejini@kpu.ac.kr


## Our Email
clonet.caca@gmail.com
