const chrome = require("selenium-webdriver/chrome");
const { Builder, By, Key, until } = require("selenium-webdriver");

function sleep(ms) {
  const wakeUpTime = Date.now() + ms;
  while (Date.now() < wakeUpTime) { }
}

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
    // await driver.get("http://localhost:8006/piece?user_id=user1&piece=ClonetDemo/1.png");
    // await driver.get("http://localhost:8005/login");
    await driver.get("http://localhost:8006/piece?user_id=user1");

    // const firstReult = await driver.findElements(By.css('img'));
    // console.log("이미지 결과 수: " + firstReult.length-1);

    // for(var i=1; i<firstReult.length; i++){
    //   console.log(await firstReult[i].getAttribute("src"));
    // }

    // // 사이드바 버튼 목록 가져오기
    // const navList = await driver.findElements(By.css('ul > li'));
    // for (var i = 0; i < navList.length; i++) {
    //   console.log(await navList[i].getText());
    // }

    // 어바웃 페이지 이동
    sleep(2000);
    const About = await driver.findElement(By.xpath("//*[@id='navbar-collapse']/ul/li[2]/a"))
    await About.click();
    console.log('About 메뉴 클릭 완료');
    sleep(3000);

    // await driver.findElements(By.id('contact_customer')).click();
    const Contact = await driver.findElement(By.xpath("//*[@id='contact_customer']"))
    await Contact.click();

    // contact 페이지 폼 가져오기
    // const emailInput = await driver.findElement(By.id('customer_email'));
    // const subjectInput = await driver.findElement(By.id('customer_subject'));
    // const messageInput = await driver.findElement(By.id('customer_message'));

    const emailInput = await driver.findElement(By.id('customer_email'));
    const subjectInput = await driver.findElement(By.id('customer_subject'));
    const messageInput = await driver.findElement(By.id('customer_message'));

    const emailInput = await driver.findElement(By.id('customer_email'));
    const subjectInput = await driver.findElement(By.id('customer_subject'));
    const messageInput = await driver.findElement(By.id('customer_message'));

    // 이메일 폼 작성 정보
    let email = "clonet.caca@gmail.com";
    let subject = "title";
    let message = "hello I'm test2";

    emailInput.sendKeys(email);
    subjectInput.sendKeys(subject);
    messageInput.sendKeys(message);

    console.log("브라우저 이름: " + await (await driver.getCapabilities()).getBrowserName());
    console.log("브라우저 버전: " + await (await driver.getCapabilities()).getBrowserVersion());
  } catch (e) {
    console.error(e);
  } finally {
    sleep(3333);
    driver.quit();
  }
})();
