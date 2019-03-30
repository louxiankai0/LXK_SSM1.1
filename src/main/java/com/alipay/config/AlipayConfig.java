package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016092600601929";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCPZpywVBqwvF/tJw5okiUuw5V/FemCdX1bLv3i5YBvmwdxFTjfUWb5aVlczOjMazC0YE2zY7skKIYh0OPkIS7yjOLSZ728GYEKfWUgZqld+eqwLRkJnneXGlDkarP89NpqXrzKLvH3K+6sd/tPvcBdzWVc9BXQoO1TtZBd7WHRmJLlz8SH6c2ErM6k5uNPosV0qcHuOV8eeiWtatpyvZvH0O+Ej5TNH+DPhCbCjG1B3uHRglXjUTAIXXN1t/VOXF8WARUpU/jNsUZ1N7rr8zqI6/jhqDIrIcuSfG9M3QNmG9ZzIi0uhFrpYcxxr1p2XjDYn+DOePaKXtVqkCYjH2UTAgMBAAECggEAOlYvJhiA5ycrCwoZdXcGw1hzp8idPyJWxdJ/HF/q+PwjceCFS2wNLSerX/JIPmjY3nhTA8htqE8IChe1refF9oxT9e6YJD5n3YGXsy+wdPenftZJ2jzqP8FH6TRzVlOxyxYRTVr9umTX6rfAt/bknARj2QW/HilpguVY/q0EX0RIsJ6ttypiTWZRsTsChQvOh2QUbPG7EwsZ9B2NplbsvkZmRxrMKuYamSr65mxNR6tCs4aFzTYnGD59eFOBVS8ECfKVL+VYrd/8E1trdQuMjH9L3IU845sqjacnQZH46ykGPpzeI2BUXS7euo0D4+KsOkSo+VURay3aoSip46jj4QKBgQDoJRsvDd74On27l0yWswJ7O75IFj2VPbaHEWkwzVTPCsN4eUaK1EUoR5emYyPNLj9fsrNtL9Qxl/lF5lQe65q0zLEAz9Voo7UalDQNLvGXWVpwKxDoR0nYMd8nYHYNO3isrfpmamuVZIova2tzvVBj814fzvgG2ty032fHYYLLgwKBgQCeIvgaKzfcu8KtFXNRP8L8do8gEvBGix8xutL9SmBjOEFIK/Ni2fswrb2fpvr5DKgKeyE0drobopDjR86YoODcLc59MwOOM/vnLE8OdIe28kVC9z2VGrMRVmaPTsNnxFtiT3jAuVaGV5hdlt/adkaiPmwneJqsEM2cUFK736/7MQKBgGxkJvUpfNpaNSrJ0jDrFFWF56qw98AfOIKIVp06wkaJuAsgVRetVT0hcGV4FNdQqLZ+MdjhZCpj0zgX+18Ukv+oM101rWdWSNFIMaWWLaeFSPzmntZVst0HLDKuj3BOPGIkOa5oMiNm9j594YYA9vA0SdaARL6uoi6xwTsPBIsRAoGANw0XcAzBmr9mq1i/V3aqC7e+Zb0SFozSJD7UusbMvV3VJCngxfX6w1yIme7IijEEwvlQevImIf67D9RssKe5AA2WR/GdeEDSngzHzNF2eZLn18M4lhLAafW5KIST9CjgY14lPHqJC6Ws7k/ayDPKrSqr/iW3OtVyrssrsinSGtECgYBxgGtKaEy1pWi5hMt6BstY9a/h7zLNn3pyKOAuv6x5Ah2KnRtzNGpeCdGsbMl9oUy5K9E9l9Uto48cNx8hNuxYTxLcxN2d3lAGvpGWPo/aYH8J8LMa6wLO19++1TrV+ftphOtWu0P7dKep8B0H5+FtHiTN7gccZ4/RWLYTBqY95w==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyHxV/LME6OBZThIp+kqKj3HBpiWjohh7jcXlppAvS/+LdpL39jNoMWXxiwuukWaT1X0f7U2LMLyDWuatEPvpR/fxCX6Z57mzKK3QHE5q62Od4SOLSOdpSswTJ0v/2/N+m5IYPntPNQdrKv31YVF8HX7BX4r0mt2BIK//ZVit/x3urpL8j8u7j3Qm7D0yop87fvu97+yaNfhNEZk9nS7GEsOzemQJ3NUO3xLWSss9zZidQfknk7HDq48D7vC5yQH0aEREd2IpnSe29tsb0FfY40d2dUUd1aY9fDF65/AVktP7j8WVdXN1wwS86AAaNcAIhQdiQyP+ValQozjSKUoT6wIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

