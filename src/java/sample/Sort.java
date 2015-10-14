import java.text.Collator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.TreeSet;

public class SortSample {
    public static void main(String[] args) {
        final List<String> itemNames = new ArrayList<String>() {
            {
                addAll(Collections.unmodifiableSet(new TreeSet<String>() {
                    {
                        add("おおかみ");
                        add("さがわけん");
                        add("ぁさがお");
                        add("かき");
                        add("カキ");
                        add("アサガオ");
                        add("がき");
                        add("あさがお");
                        add("バイク");
                        add("ん");
                        add("ァサガオ");
                        add("ガキ");
                        add("kaki");
                    }
                }));
            }
        };
        Collections.sort(itemNames);
        ln(itemNames);
        Collections.sort(itemNames, Collator.getInstance(Locale.JAPANESE));
        ln(itemNames);
    }

    private static void ln(final List<String> itemNames) {
        for (final String str : itemNames) {
            System.out.println(str);
        }
    }
}
