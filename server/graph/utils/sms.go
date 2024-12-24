package utils

import (
	"fmt"
	"os"

	"github.com/aliyun/alibaba-cloud-sdk-go/services/dysmsapi"
)

var (
	aliyunRegion     string
	aliyunAccessKey  string
	aliyunSecretKey  string
	aliyunSignName   string
	aliyunTemplateID string
)

func init() {
	// Load SMS configuration from environment variables
	aliyunRegion = os.Getenv("ALIYUN_SMS_REGION")
	if aliyunRegion == "" {
		aliyunRegion = "cn-hangzhou" // Default region
	}

	aliyunAccessKey = os.Getenv("ALIYUN_ACCESS_KEY")
	if aliyunAccessKey == "" {
		panic("ALIYUN_ACCESS_KEY environment variable is not set")
	}

	aliyunSecretKey = os.Getenv("ALIYUN_SECRET_KEY")
	if aliyunSecretKey == "" {
		panic("ALIYUN_SECRET_KEY environment variable is not set")
	}

	aliyunSignName = os.Getenv("ALIYUN_SMS_SIGN_NAME")
	if aliyunSignName == "" {
		panic("ALIYUN_SMS_SIGN_NAME environment variable is not set")
	}

	aliyunTemplateID = os.Getenv("ALIYUN_SMS_TEMPLATE_ID")
	if aliyunTemplateID == "" {
		panic("ALIYUN_SMS_TEMPLATE_ID environment variable is not set")
	}
}

func SendOTP(phoneNumber string, otpCode string) error {
	// Create Aliyun SMS client
	client, err := dysmsapi.NewClientWithAccessKey(
		aliyunRegion,
		aliyunAccessKey,
		aliyunSecretKey,
	)
	if err != nil {
		return err
	}

	// Create SMS request
	request := dysmsapi.CreateSendSmsRequest()
	request.Scheme = "https"
	request.PhoneNumbers = phoneNumber
	request.SignName = aliyunSignName
	request.TemplateCode = aliyunTemplateID
	request.TemplateParam = fmt.Sprintf(`{"code":"%s"}`, otpCode)

	// Send SMS
	response, err := client.SendSms(request)
	if err != nil {
		return err
	}

	if response.Code != "OK" {
		return fmt.Errorf("SMS sending failed: %s", response.Message)
	}

	return nil
}
