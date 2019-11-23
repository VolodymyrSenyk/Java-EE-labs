package model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class Day {
    private String dayOfTheWeek;
    private ArrayList<Pair> pairs;

    public String getDayOfTheWeek() {
        return dayOfTheWeek;
    }

    public void setDayOfTheWeek(String dayOfTheWeek) {
        this.dayOfTheWeek = dayOfTheWeek;
    }

    public ArrayList<Pair> getPairs() {
        return pairs;
    }

    public void setPairs(ArrayList<Pair> pairs) {
        this.pairs = pairs;
    }

    public static Day sortPairs(Day day) {
        boolean sorted = false;
        Pair temp;
        while(!sorted && day.getPairs() != null) {
            sorted = true;
            for (int i = 0; i < day.getPairs().size() - 1; i++) {
                if(!(day.getPairs().get(i).getTime().equals("") || day.getPairs().get(i+1).getTime().equals(""))) {
                    if(Integer.parseInt(day.getPairs().get(i).getTime().replace(":", ""))
                        > Integer.parseInt(day.getPairs().get(i + 1).getTime().replace(":", ""))) {
                        sorted = false;
                        temp = day.getPairs().get(i);
                        day.getPairs().set(i, day.getPairs().get(i + 1));
                        day.getPairs().set(i + 1, temp);
                    }
                }
                else if(day.getPairs().get(i).getTime().equals("") &&
                 !(day.getPairs().get(i).getTime().equals("") && day.getPairs().get(i+1).getTime().equals(""))) {
                    sorted = false;
                    temp = day.getPairs().get(i);
                    day.getPairs().set(i, day.getPairs().get(i + 1));
                    day.getPairs().set(i + 1, temp);
                }
            }
        }
        return day;
    }

    public static Day readXML(ServletContext sc, String filename) {
        filename = sc.getRealPath("weeks/") + filename + ".xml";
        Day day = new Day();
        ArrayList<Pair> pairs = new ArrayList<>();
        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(filename);
            doc.getDocumentElement().normalize();
            NodeList nodeDayOfTheWeek = doc.getElementsByTagName("Day");
            for(int i=0; i<nodeDayOfTheWeek.getLength(); i++) {
                Node node = nodeDayOfTheWeek.item(i);
                if (Node.ELEMENT_NODE == node.getNodeType()) {
                    Element element = (Element) node;
                    day.setDayOfTheWeek(element.getElementsByTagName("DayOfTheWeek").item(0).getTextContent());
                }
            }          
            NodeList nodeList = doc.getElementsByTagName("Pair");
            for(int i=0; i<nodeList.getLength(); i++) {
                Node node = nodeList.item(i);
                if (Node.ELEMENT_NODE == node.getNodeType()) {
                    Element element = (Element) node;

                    Pair pair = new Pair(element.getElementsByTagName("Time").item(0).getTextContent(),
                                            element.getElementsByTagName("Name").item(0).getTextContent(),
                                            element.getElementsByTagName("Teacher").item(0).getTextContent(),
                                            element.getElementsByTagName("Place").item(0).getTextContent(),
                                            element.getElementsByTagName("TypeOfPair").item(0).getTextContent());
                    pairs.add(pair);

                }
            }
        }
        catch(FileNotFoundException e) {
            System.out.println("File not found");
        }
        catch(Exception e) {
            System.out.println("Parsing exception");
        }
        day.setPairs(pairs);
        return day;
    }
    
    public static void writeXML(ServletContext sc, Day day, String filename) {
        try {
            day = Day.sortPairs(day);

            filename = sc.getRealPath("weeks/") + filename + ".xml";

            Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();

            Element dayOfTheWeek = document.createElement("Day");
            document.appendChild(dayOfTheWeek);

            Element dOTW = document.createElement("DayOfTheWeek");
                dOTW.setTextContent(day.getDayOfTheWeek());
                dayOfTheWeek.appendChild(dOTW);

            Element data = document.createElement("Pairs");
            dayOfTheWeek.appendChild(data);
            for(int i=0; i<day.getPairs().size(); i++) {
                Element pair = document.createElement("Pair");
                data.appendChild(pair);

                Element time = document.createElement("Time");
                time.setTextContent(day.getPairs().get(i).getTime());
                pair.appendChild(time);
                Element name = document.createElement("Name");
                name.setTextContent(day.getPairs().get(i).getName());
                pair.appendChild(name);
                Element teacher = document.createElement("Teacher");
                teacher.setTextContent(day.getPairs().get(i).getTeacher());
                pair.appendChild(teacher);
                Element place = document.createElement("Place");
                place.setTextContent(day.getPairs().get(i).getPlace());
                pair.appendChild(place);
                Element type = document.createElement("TypeOfPair");
                type.setTextContent(day.getPairs().get(i).getTypeOfPair());
                pair.appendChild(type);
            }
            Transformer transformer = TransformerFactory.newInstance().newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.transform(new DOMSource(document), new StreamResult(new FileOutputStream(new File(filename))));
        } catch (Exception  e) {
            e.printStackTrace();
        }
    }
    
}
