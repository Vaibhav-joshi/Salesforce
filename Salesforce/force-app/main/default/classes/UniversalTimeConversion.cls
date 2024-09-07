public with sharing class UniversalTimeConversion {
    
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
    public static double iAmXHoursAheadOfGivenTz(String inputTz){
 		return iAmXMinutesAheadOfGivenTz(inputTz)/60.0;
    }
    public static Double iAmXMinutesAheadOfGivenTz(String inputTz){
 		return iAmXSecondsAheadOfGivenTz(inputTz)/60;
    }
    public static Double iAmXSecondsAheadOfGivenTz(String inputTz){
 		Integer myOffsetInMins = getOffsetForGivenTzInMinutes(getTzCurrentUser().toString());
        Integer otherOffsetInMins = getOffsetForGivenTzInMinutes(inputTz);
        return (myOffsetInMins - otherOffsetInMins)*60.0;
    }
    public static Integer getOffsetForGivenTzInMinutes(String inputTzStr){
 		return (getTzforGivenTzStr(inputTzStr).getOffset(getNowTimeInUtc()) / (1000 * 60));
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