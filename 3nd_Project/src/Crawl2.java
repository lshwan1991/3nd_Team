
import java.util.ArrayList;
import java.util.List;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;


public class Crawl2 {

	public static void main(String[] args) {
		
		System.setProperty("webdriver.chrome.driver",
				"C:\\Users\\SMHRD\\Downloads\\chromedriver_win32\\chromedriver.exe");
		
		ChromeOptions chromeOptions = new ChromeOptions();
		chromeOptions.addArguments("--headless"); 
		chromeOptions.addArguments("--no-sandbox"); 
		WebDriver driver = new ChromeDriver(chromeOptions);

		
		//WebDriver driver = new ChromeDriver();
		driver.get("https://www.gwangju.go.kr/c19/");
		
		//List<WebElement> objSpanList = driver.findElements(By.xpath("/html/body/div/div[3]/div/div/div/div[1]/p[2]/span"));
		
		List<WebElement> objSpanList = new ArrayList<WebElement>();
		
		objSpanList.add(0, driver.findElement(By.cssSelector("p.key_num.counter.num1 > span")));
		objSpanList.add(1, driver.findElement(By.cssSelector("span.cell.col2.counter.num2 > span")));
		objSpanList.add(2, driver.findElement(By.cssSelector("span.cell.col2.counter.num3 > span")));
		objSpanList.add(3, driver.findElement(By.cssSelector("span.cell.col2.counter.num4 > span")));
		
		objSpanList.add(4, driver.findElement(By.cssSelector("p.key_num.counter.num6 > span")));
		objSpanList.add(5, driver.findElement(By.cssSelector("span.cell.col2.counter.num7 > span")));
		objSpanList.add(6, driver.findElement(By.cssSelector("span.cell.col2.counter.num8 > span")));
		objSpanList.add(7, driver.findElement(By.cssSelector("span.cell.col2.counter.num9 > span")));
		
		objSpanList.add(8, driver.findElement(By.cssSelector("p.key_num.counter.num10 > span")));
		objSpanList.add(9, driver.findElement(By.cssSelector("span.cell.col2.counter.num11 > span")));
		objSpanList.add(10, driver.findElement(By.cssSelector("span.cell.col2.counter.num12 > span")));
		
		objSpanList.add(11, driver.findElement(By.cssSelector("td.gu_num_2")));
		objSpanList.add(12, driver.findElement(By.cssSelector("td.gu_num_3")));
		objSpanList.add(13, driver.findElement(By.cssSelector("td.gu_num_4")));
		objSpanList.add(14, driver.findElement(By.cssSelector("td.gu_num_5")));
		objSpanList.add(15, driver.findElement(By.cssSelector("td.gu_num_6")));
		
		for(int i=0; i<objSpanList.size(); i++) {
			System.out.println(objSpanList.get(i).getText());
		}
		//for (WebElement e : objSpanList) {
	           //System.out.println(":"+e.getText());
	       //}
		
	}

}
