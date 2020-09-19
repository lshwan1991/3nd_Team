package Test.Ajax;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Crawling {
	public List<WebElement> Crawling_Co() {
		System.setProperty("webdriver.chrome.driver",
				"C:\\Users\\SMHRD\\Downloads\\chromedriver_win32\\chromedriver.exe");
		WebDriver driver = new ChromeDriver();
		driver.get("https://www.gwangju.go.kr/c19/");
		//List<WebElement> objSpanList = driver.findElements(By.xpath("/html/body/div/div[3]/div/div/div/div[1]/p[2]/span"));
		
		List<WebElement> objSpanList = new ArrayList<WebElement>();
		
		objSpanList.add(0, driver.findElement(By.xpath("/html/body/div/div[3]/div/div/div/div[1]/p[2]/span")));
		objSpanList.add(1, driver.findElement(By.xpath("/html/body/div/div[3]/div/div/div/div[1]/div/div[1]/span[2]/span")));
		objSpanList.add(2, driver.findElement(By.xpath("/html/body/div/div[3]/div/div/div/div[1]/div/div[2]/span[2]/span")));
		objSpanList.add(3, driver.findElement(By.xpath("/html/body/div/div[3]/div/div/div/div[1]/div/div[3]/span[2]/span")));
		
		for(int i=0; i<objSpanList.size(); i++) {
			System.out.println(objSpanList.get(i).getText());
		}
		
		return objSpanList;
	}
}
