public with sharing class UniversalTimeConversion {
    public UniversalTimeConversion() {

    }
    public static DateTime getNowTimeForGivenTz(String inputTzStr){
        Datetime utcNow = getNowTimeInUtc();
        system.debug('~~getNowTimeForGivenTz - '+utcNow.addMinutes(getOffsetForGivenTzInMinutes(inputTzStr)));
        return utcNow.addMinutes(getOffsetForGivenTzInMinutes(inputTzStr));
    } 
    public static void getThisTimeInGivenTz(Datetime inputDt, String inputTz){
 
    }
    public static void getThisTimeInUtc(Datetime inputDt, String inputTz){
 
    }
    public static void getTodayDateGivenTz(String inputTz){
 
    }
    public static void getTodayDayForGivenTz(String inputTz){
 
    }
    public static void iAmXHoursAheadOfGivenTz(String inputTz){
 
    }
    public static void iAmXMinutesAheadOfGivenTz(String inputTz){
 
    }
    public static void iAmXSecondsAheadOfGivenTz(String inputTz){
 
    }
    public static Integer getOffsetForGivenTzInMinutes(String inputTzStr){
 		return inputTzStr != 'GMT' ? (getTzforGivenTzStr(inputTzStr).getOffset(getNowTimeInUtc()) / (1000 * 60)) : 0;
    }
    public static void getMyOffsetDiffForGivenTz(String inputTz){
 
    }
    public static Datetime getNowTimeInUtc(){
        return System.now();
    }
    public static TimeZone getTzCurrentUser(){
        return UserInfo.getTimeZone();
    }
    public static TimeZone getTzforGivenTzStr(String inputTzStr){
        return Timezone.getTimeZone(inputTzStr);
    }
}