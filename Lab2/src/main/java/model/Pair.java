package model;

public class Pair {
    private String time;
    private String name;
    private String teacher;
    private String place;
    private String typeOfPair;
    private String additional;

    public Pair(String time, String name, String teacher, String place, String type) {
        this.time = time;
        this.name = name;
        this.teacher = teacher;
        this.place = place;
        this.typeOfPair = type;
    }
    
    public String getTime() {
        return time;
    }
    
    public void setTime(String time) {
        String correct = time.replace("/", ":"). replace("-", ":");
        char[] temp = correct.toCharArray();
        String hours = "";
        String minutes = "";
        int j=0;
        for(int i=0; i<temp.length; i++) {
            if(Character.isDigit(temp[i]) && j<2) {
                hours = hours + temp[i];
                temp[i] = '!';
                j++;
            }
            else
                break;
        }
        j=0;
        StringBuilder buf = new StringBuilder();
        for(int i=0; i<temp.length; i++) {
            if (Character.isDigit(temp[i]) && j<2) {
                buf.append(temp[i]);
                j++;
            }
        }
        minutes = buf.toString();
        if(hours.equals("") && minutes.equals("")) {
            this.time = "";
            return;
        }
        if(hours.equals(""))
            hours = "00";
        if(minutes.equals(""))
            minutes = "00";
        if(minutes.toCharArray().length < 2)
            minutes += "0";
        this.time = hours+":"+minutes;
    }
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getTeacher() {
        return teacher;
    }
    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }
    public String getPlace() {
        return place;
    }
    public void setPlace(String place) {
        this.place = place;
    }
    public String getTypeOfPair() {
        return typeOfPair;
    }
    public void setTypeOfPair(String typeOfPair) {
        this.typeOfPair = typeOfPair;
    }
    public String getAdditional() {
        return additional;
    }
    public void setAdditional(String additional) {
        this.additional = additional;
    }
    
}
