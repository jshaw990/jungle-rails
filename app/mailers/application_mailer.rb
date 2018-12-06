class ApplicationMailer < ActionMailer::Base
    default fromL "no-reply@jungle.com"

    def send_receipt(order)
        body = "Test Email"
        mail(to: order.email, subject: order.id, body: body).deliver
    end

    def send_test_email
        body = "Test Email Sent"
        mail(to: 'jayden.shaw@gmail.com', subject: 'Test Email Sent', body: body).deliver
    end
end