const chrome = require("selenium-webdriver/chrome");
const { Builder, By, Key, until } = require("selenium-webdriver");

(async function seleniumTest() {
  let url = "http://localhost:8006/piece?user_id=user2&piece=ClonetDemo/1.png";

  let driver = await new Builder()
    .forBrowser("chrome")
    .setChromeService(
      chrome.setDefaultService(
        new chrome.ServiceBuilder("./drivers/chromedriver").build()
      )
    )
    .build();

  try {
    await driver.get(url);

    const firstResult = await driver.findElements(By.css('img'));
    // console.log("결과 수: " + firstReult.length-1);

    for(var i=1; i<firstResult.length; i++){
      const height = await firstResult[i].getAttribute("height");
      if(height !=0){
        console.log(await firstResult[i].getAttribute("src"));
      }else{
        console.log("발견된 이미지가 없습니다.");
        break;
      }
    }

    console.log("브라우저 이름: " + await (await driver.getCapabilities()).getBrowserName());
    console.log("브라우저 버전: " + await (await driver.getCapabilities()).getBrowserVersion());
  } finally {
    driver.quit();
  }
})();
