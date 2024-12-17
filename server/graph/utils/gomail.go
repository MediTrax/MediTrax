package utils

import (
	"fmt"
	"log"
	"os"
	"time"

	"github.com/joho/godotenv"
	"gopkg.in/gomail.v2"
)

var ch chan *gomail.Message

func init() {
	err := godotenv.Load(".env")

	if err != nil {
		log.Fatal("Error loading .env file")
	}

	SMTPServer := os.Getenv("SMTP_SERVER")
	SMTPUser := os.Getenv("SMTP_USER")
	SMTPPassword := os.Getenv("SMTP_PASS")
	ch = make(chan *gomail.Message)

	go func() {
		d := gomail.NewDialer(SMTPServer, 587, SMTPUser, SMTPPassword)

		var s gomail.SendCloser
		var err error
		open := false
		for {
			select {
			case m, ok := <-ch:
				if !ok {
					return
				}
				if !open {
					if s, err = d.Dial(); err != nil {
						panic(err)
					}
					open = true
				}
				if err := gomail.Send(s, m); err != nil {
					log.Print(err)
				}
				fmt.Println("sent")
			// Close the connection to the SMTP server if no email was sent in
			// the last 30 seconds.
			case <-time.After(30 * time.Second):
				if open {
					if err := s.Close(); err != nil {
						panic(err)
					}
					open = false
				}
			}
		}
	}()
}

func SendEmailVerification(email string, name string, token string) {
	m := gomail.NewMessage()
	m.SetHeader("From", "noreply@wmtech.cc")
	m.SetHeader("To", email)
	// m.SetAddressHeader("Cc", "dan@example.com", "Dan")
	// m.Embed("/assets/beautifood-logo.png")
	m.SetHeader("Subject", "Thank You for Registering SYJ")
	message := fmt.Sprintf(EmailVerificationTemplate, name, "https://syj-inhouse-workflow.jomluz.com/email-verification/"+token)
	m.SetBody("text/html", message)
	ch <- m
}

func SendPasswordResetEmail(email string, name string, token string) {
	m := gomail.NewMessage()
	m.SetHeader("From", "noreply@wmtech.cc")
	m.SetHeader("To", email)
	// m.SetAddressHeader("Cc", "dan@example.com", "Dan")
	// m.Embed("/assets/beautifood-logo.png")
	m.SetHeader("Subject", "SYJ Password Reset")
	m.SetBody("text/html", fmt.Sprintf(PasswordResetTemplate, name, "https://syj-inhouse-workflow.jomluz.com/password-reset/"+token))
	ch <- m
}
