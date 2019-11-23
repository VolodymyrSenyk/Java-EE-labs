package model;

import java.util.ArrayList;

public class DayToShow {
	private static DayToShow instance = new DayToShow();
	private int number;

	public static DayToShow getInstance() {
		return instance;
	}

	private DayToShow() {
		number = 11;
	}

	public int getNumber() {
        return number;
    }

    public void setNumber(int num) {
        number = num;
    }

    public String getName() {
        return DayToShow.getName(number);
    }

    public static int prev(int num) {
        switch(num) {
            case 11:
                return 15;
            case 21:
                return 25;
            default:
                return num - 1;
        }
    }

    public static int next(int num) {
        switch(num) {
            case 15:
                return 11;
            case 25:
                return 21;
            default:
                return num + 1;
        }
    }

    public static int maxNumOfPairs(ArrayList<Day> week) {
        int max = 0;
        for(int i=0; i<week.size(); i++) {
            if(week.get(i).getPairs().size()>max)
                max = week.get(i).getPairs().size();
        }
        return max;
    }

    public static String getName(int num) {
    	switch(num) {
    		case 11:
    			return "monday1";
    		case 12:
    			return "tuesday1";
			case 13:
    			return "wednesday1";
			case 14:
    			return "thursday1";
			case 15:
    			return "friday1";
    		case 21:
    			return "monday2";
    		case 22:
    			return "tuesday2";
			case 23:
    			return "wednesday2";
			case 24:
    			return "thursday2";
			case 25:
    			return "friday2";
    		default:
    			return "monday1";
    	}
    }

    public static String getNameToShow(String name) {
    	return name.substring(0,  1).toUpperCase() + name.substring(1, name.length()-1);
    }
    
    public static String getNameToShow(int number) {
        String name = DayToShow.getName(number);
        return name.substring(0,  1).toUpperCase() + name.substring(1, name.length()-1);
    }
    
}
