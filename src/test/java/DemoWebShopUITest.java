import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import static org.junit.jupiter.api.Assertions.assertTrue;

class DemoWebShopUITest {

    private WebDriver driver;

    @BeforeEach
    void setUp() {
        driver = new ChromeDriver();
    }

    @Test
    void shouldLoginSuccessfully() {
        driver.get("https://demowebshop.tricentis.com/login");

        driver.findElement(By.id("Email")).sendKeys("emilienhuret@gmail.com");
        driver.findElement(By.id("Password")).sendKeys("fortnite1234");
        driver.findElement(By.cssSelector("input.login-button")).click();

        WebElement accountLink = driver.findElement(By.cssSelector("a.account"));
        assertTrue(accountLink.getText().contains("emilienhuret@gmail.com"), "The user should be logged in.");
    }

    @Test
    void shouldSearchProduct() {
        driver.get("https://demowebshop.tricentis.com");

        driver.findElement(By.id("small-searchterms")).sendKeys("book");
        driver.findElement(By.cssSelector("input.search-box-button")).click();

        WebElement searchKeywordText = driver.findElement(By.id("Q"));
        assertTrue(searchKeywordText.getAttribute("value").contains("book"), "The search results page should display the search keyword.");
    }

    @AfterEach
    void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}