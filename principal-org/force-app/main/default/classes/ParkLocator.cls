public class ParkLocator {
    public static String[] country(String arg0) {
            ParkService.ParksImplPort request_x = new ParkService.ParksImplPort();        	
            return request_x.byCountry(arg0);
    }
}