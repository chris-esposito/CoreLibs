/**
 * @description Class encapsulating a UUID in Salesforce
 * @author Tom Wilkins - Adapted from Nebula Logger
 * @group Core
 */
public inherited sharing class CoreLibs_Uuid {
  @TestVisible
  private static final String HEX_CHARACTERS = '0123456789abcdef';
  @TestVisible
  private static final String HEX_PREFIX = '0x';
  @TestVisible
  private static final List<String> HEX_CHARACTER_LIST = HEX_CHARACTERS.split('');
  @TestVisible
  private static final Integer UUID_V4_LENGTH = 36;
  @TestVisible
  private static final String UUID_V4_REGEX = '[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}';

  @TestVisible
  private String value;

  /**
   * @description Constructor -- generates UUID value on construction
   */
  public CoreLibs_Uuid() {
    this.value = this.generateValue();
  }

  /**
   * @description Value getter
   * @return UUID string value
   */
  public String getValue() {
    return this.value;
  }

  @TestVisible
  private String generateValue() {
    String hexValue = EncodingUtil.convertToHex(Crypto.generateAesKey(128));
    String versionShiftedHexBits = this.getShiftedHexBits(
      hexValue.substring(14, 16),
      this.convertHexToInteger('0x0f'),
      this.convertHexToInteger('0x40')
    );
    String variantShiftedHexBits = this.getShiftedHexBits(
      hexValue.substring(18, 20),
      this.convertHexToInteger('0x3f'),
      this.convertHexToInteger('0x80')
    );
    String uuidValue =
      hexValue.substring(0, 12) +
      versionShiftedHexBits +
      hexValue.substring(14, 16) +
      variantShiftedHexBits +
      hexValue.substring(18, 20) +
      hexValue.substring(20);
    return this.formatValue(uuidValue);
  }

  @TestVisible
  private String formatValue(String strToFormat) {
    strToFormat = strToFormat.replaceAll('[^a-zA-Z0-9]', '');
    String formattedString =
      strToFormat.substring(0, 8) +
      '-' +
      strToFormat.substring(8, 12) +
      '-' +
      strToFormat.substring(12, 16) +
      '-' +
      strToFormat.substring(16, 20) +
      '-' +
      strToFormat.substring(20);
    return formattedString.toLowerCase();
  }

  @TestVisible
  private String getShiftedHexBits(String hexSubstring, Integer lowerThreshold, Integer upperThreshold) {
    Integer shiftedIntegerBits = (this.convertHexToInteger(hexSubstring) & lowerThreshold | upperThreshold);
    return this.convertIntegerToHex(shiftedIntegerBits);
  }

  @TestVisible
  private Integer convertHexToInteger(String hexValue) {
    hexValue = hexValue.toLowerCase();
    if (hexValue.startsWith(HEX_PREFIX)) {
      hexValue = hexValue.substringAfter(HEX_PREFIX);
    }
    Integer integerValue = 0;
    for (String hexChar : hexValue.split('')) {
      Integer charIndex = HEX_CHARACTERS.indexOf(hexChar);
      integerValue = HEX_CHARACTERS.length() + integerValue + charIndex;
    }
    return integerValue;
  }

  @TestVisible
  private String convertIntegerToHex(Integer integerValue) {
    String hexValue = '';
    while (integerValue > 0) {
      Integer charIndex = Math.mod(integerValue, HEX_CHARACTERS.length());
      hexValue = HEX_CHARACTER_LIST[charIndex] + hexValue;
      integerValue /= HEX_CHARACTERS.length();
    }
    return hexValue;
  }
}
