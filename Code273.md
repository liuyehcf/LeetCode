# Integer to English Words

```java
class Solution {

    public String numberToWords(int num) {
        if (num == 0) {
            return "Zero";
        }

        int billion = num / 1000000000;
        num -= billion * 1000000000;

        int million = num / 1000000;
        num -= million * 1000000;

        int thousand = num / 1000;
        num -= thousand * 1000;

        StringBuilder sb = new StringBuilder();

        if (billion > 0) {
            sb.append(getEnglish(billion)).append(" Billion");
        }

        if (million > 0) {
            sb.append(' ').append(getEnglish(million)).append(" Million");
        }

        if (thousand > 0) {
            sb.append(' ').append(getEnglish(thousand)).append(" Thousand");
        }

        if (num > 0) {
            sb.append(' ').append(getEnglish(num));
        }

        if (sb.charAt(0) == ' ') {
            return sb.substring(1);
        }

        return sb.toString();
    }

    private String getEnglish(int num) {
        int hundred = num / 100;
        num -= hundred * 100;

        int ten = num / 10;
        num -= ten * 10;

        StringBuilder sb = new StringBuilder();

        if (hundred != 0) {
            sb.append(single(hundred)).append(" Hundred");
        }

        if (ten == 1) {
            sb.append(' ').append(tens(ten * 10 + num));
        } else if (ten > 1) {
            sb.append(' ').append(moreThanTens(ten));

            if (num > 0) {
                sb.append(' ').append(single(num));
            }
        } else {
            if (num > 0) {
                sb.append(' ').append(single(num));
            }
        }

        if (sb.charAt(0) == ' ') {
            return sb.substring(1);
        }

        return sb.toString();
    }

    private String single(int num) {
        switch (num) {
            case 1:
                return "One";
            case 2:
                return "Two";
            case 3:
                return "Three";
            case 4:
                return "Four";
            case 5:
                return "Five";
            case 6:
                return "Six";
            case 7:
                return "Seven";
            case 8:
                return "Eight";
            case 9:
                return "Nine";
            default:
                throw new RuntimeException();
        }
    }

    private String tens(int num) {
        switch (num) {
            case 10:
                return "Ten";
            case 11:
                return "Eleven";
            case 12:
                return "Twelve";
            case 13:
                return "Thirteen";
            case 14:
                return "Fourteen";
            case 15:
                return "Fifteen";
            case 16:
                return "Sixteen";
            case 17:
                return "Seventeen";
            case 18:
                return "Eighteen";
            case 19:
                return "Nineteen";
            default:
                throw new RuntimeException();
        }
    }

    private String moreThanTens(int num) {
        switch (num) {
            case 2:
                return "Twenty";
            case 3:
                return "Thirty";
            case 4:
                return "Forty";
            case 5:
                return "Fifty";
            case 6:
                return "Sixty";
            case 7:
                return "Seventy";
            case 8:
                return "Eighty";
            case 9:
                return "Ninety";
            default:
                throw new RuntimeException();
        }
    }
}
```