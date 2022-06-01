const chrome = require("selenium-webdriver/chrome");
const { Builder, By, Key, until } = require("selenium-webdriver");

(async function seleniumTest() {
  let driver = await new Builder()
    .forBrowser("chrome")
    .setChromeService(
      chrome.setDefaultService(
        new chrome.ServiceBuilder("./drivers/chromedriver").build()
      )
    )
    .build();

  try {
    await driver.get("http://localhost:8006/piece?user_id=user1&piece=ClonetDemo/1.png");

    const firstReult = await driver.findElements(By.css('img'));
    // console.log("결과 수: " + firstReult.length-1);

    for(var i=1; i<firstReult.length; i++){
      console.log(await firstReult[i].getAttribute("src"));
    }
    
    console.log("브라우저 이름: " + await (await driver.getCapabilities()).getBrowserName());
    console.log("브라우저 버전: " + await (await driver.getCapabilities()).getBrowserVersion());
  } finally {
    driver.quit();
  }
})();
