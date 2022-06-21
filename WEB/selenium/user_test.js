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
    await driver.get("http://localhost:8005/login");

    // 아이디 비밀번호 
    const idInput = await driver.findElement(By.id('id'));
    const passwdInput = await driver.findElement(By.id('passwd'));

    // 아이디 비밀번호 입력
    let id = "user2";
    let passwd = 'passwd';
    idInput.sendKeys(id);
    passwdInput.sendKeys(passwd);

    sleep(3000);

    // 로그인 버튼 클릭
    const loginSubmit = await driver.findElement(By.id('login_submit'));
    await loginSubmit.click();
    console.log('로그인 버튼 클릭 완료');

    // 사이드바 버튼 목록 가져오기
    const navList = await driver.findElements(By.css('ul > li'));
    for (var i = 0; i < navList.length; i++) {
      console.log(await navList[i].getText());
    }

    // 어바웃 페이지 이동
    sleep(3000);
    const About = await driver.findElement(By.xpath("//*[@id='navbar-collapse']/ul/li[2]/a"))
    await About.click();
    console.log('About 메뉴 클릭 완료');
    sleep(3000);

    // 어바웃 정보 가져오기
    // const aboutInput = await driver.findElement(By.name("about_edit"))
    //   .getAttribute("value")
    //   .then((value) => { return value; });
    // console.log(aboutInput);

    // let about = " 테스트";
    // aboutInput.sendKeys(about);
    const aboutSubmit = await driver.findElement(By.id('about_submit'));
    await aboutSubmit.click();
    console.log('about 수정 클릭 완료');

    // 콘텍트 페이지 이동
    sleep(3000);
    const Contact = await driver.findElement(By.xpath("//*[@id='navbar-collapse']/ul/li[4]/a"))
    await Contact.click();
    console.log('contact 메뉴 클릭 완료');
    sleep(3000);

    // 이메일 정보 가져오기
    // const contactInput = await driver.findElement(By.name("contact_edit"))
    //   .getAttribute("value")
    //   .then((value) => { return value; });
    // console.log(contactInput);

    // let email = "clonet.caca@gmail.com";
    // contactInput.sendKeys(email);
    const contactSubmit = await driver.findElement(By.id('contact_submit'));
    await contactSubmit.click();

    // 일러스트 페이지 이동
    sleep(3000);
    const illustSelect = await driver.findElement(By.xpath("//*[@id='navbar-collapse']/ul/li[3]/a"))
    await illustSelect.click();
    console.log('illustSelect 메뉴 클릭 완료');
    sleep(3000);

    const firstReult = await driver.findElements(By.css('img'));
    console.log("이미지 결과 수: " + firstReult.length-1);

    for(var i=1; i<firstReult.length; i++){
      console.log(await firstReult[i].getAttribute("src"));
    }

    console.log("브라우저 이름: " + await (await driver.getCapabilities()).getBrowserName());
    console.log("브라우저 버전: " + await (await driver.getCapabilities()).getBrowserVersion());
  } catch (e) {
    console.error(e);
  } finally {
    sleep(3333);
    driver.quit();
  }
})();
