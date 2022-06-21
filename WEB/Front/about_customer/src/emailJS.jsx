import emailjs from '@emailjs/browser';
import React, { useRef } from 'react';
import { Form } from "react-bootstrap";

const ContactUs = (props) => {
    const form = useRef();

    const sendEmail = (e) => {
        e.preventDefault();

        emailjs.sendForm('clonet', 'template_90u4flc', form.current, 'vNTwa_F73GQIX1_Ri')
            .then((result) => {
                console.log(result.text);
            }, (error) => {
                console.log(error.text);
            });
    };

    return (
        <div>
            <Form ref={form} onSubmit={sendEmail}>
                <div class="col-md-6">
                    <div class="form-group">
                        <input type="email" value={props.user_email} class="form-control" name="to_email" placeholder="Email" readonly/>
                    </div>
                    <div class="form-group">
                        <input type="text" value={props.user_name} class="form-control" name="to_name" placeholder="Subject" />
                    </div>
                    <div class="form-group">
                        <input type="email" id="customer_email" class="form-control" name="from_email" placeholder="Your Email" />
                    </div>
                    <div class="form-group">
                        <input type="text" id="customer_subject" class="form-control" name="from_name" placeholder="Subject" />
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" id="customer_message" rows="3" name="message" placeholder="Enter your message" />
                    </div>
                    <button type="submit" id="contact_submit" value="Send" class="btn btn-primary btn-lg">Send</button>
                </div>
            </Form>
        </div>
    );
}

export default ContactUs;