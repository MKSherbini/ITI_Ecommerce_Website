package constants;

public class WebsiteConstants {
    // database
    public static String Email = "temp@temp.temp";
    public static String Password = "temp";


    private String WebsiteName = "ChillStore";


    private static volatile WebsiteConstants instance = null;

    private WebsiteConstants() {
        if (instance != null)
            throw new RuntimeException("Use getInstance(), reflection is not allowed");
    }

    public static WebsiteConstants getInstance() {
        if (instance == null) {
            synchronized (WebsiteConstants.class) {
                if (instance == null) {
                    instance = new WebsiteConstants();
                }
            }
        }
        return instance;
    }

    public String getWebsiteName() {
        return WebsiteName;
    }
}
