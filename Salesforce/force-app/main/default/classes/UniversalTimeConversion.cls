public with sharing class UniversalTimeConversion {
    public UniversalTimeConversion() {

    }
    public static DateTime getNowTimeForGivenTz(String inputTzStr){
        return getNowTimeInUtc().addMinutes(getOffsetForGivenTzInMinutes(inputTzStr));
    } 
    public static Datetime getThisTimeInGivenTz(Datetime inputDt, String inputTzStr){
        return inputDt.addMinutes(getOffsetForGivenTzInMinutes(getTzCurrentUser().toString()));
    }
    public static Datetime getThisTimeInUtc(Datetime inputDt, String inputTzStr){
        return getThisTimeInGivenTz(inputDt, inputTzStr).addMinutes(-getOffsetForGivenTzInMinutes(inputTzStr));
    }
    public static Date getTodayDateGivenTz(String inputTz){
 		return getNowTimeForGivenTz(inputTz).date();
    }
    public static String getTodayDayForGivenTz(String inputTz){
        return getNowTimeForGivenTz(inputTz).format('EEEE');
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