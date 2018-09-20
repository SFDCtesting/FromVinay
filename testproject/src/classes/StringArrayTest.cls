public class StringArrayTest {

    public static List<String> generateStringArray(Integer i){
        List<String> Sample = new List<String>();
        for(Integer j=0;j<i;j++)
        {
            Sample.add('Test '+j);
        }
        for(Integer j=0;j<Sample.size();j++) {
    // Write value to the debug log
            System.debug(Sample[j]);
        }
        
       return Sample;
    }
}