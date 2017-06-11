package model.Tools;

/**
 * Created by Beruto and Pablo Berbel on 10/6/17. Project -> skillshare
 */
public class StatisticalElement {

    private String label;

    private int value;

    public StatisticalElement() {

    }

    public StatisticalElement(String label, int value) {
        this.label = label;
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "StatisticalElement{" +
                "label='" + label + '\'' +
                ", value=" + value +
                '}';
    }
}
