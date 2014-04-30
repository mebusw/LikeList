package org.likelist.struts.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
import com.huangzhimin.contacts.Contact;
import com.huangzhimin.contacts.ContactsImporter;
import com.huangzhimin.contacts.ContactsImporterFactory;
import com.huangzhimin.contacts.exception.ContactsException;
public class ContactsGetter {
    public static void main(String args[]) 
    {
    System.out.println("=================================================");
    System.out.println("Gmail contacts");
    try {
      ContactsImporter importer = ContactsImporterFactory
             .getGmailContacts("eshunjian@gmail.com", "yubao8412");
        List<Contact> contacts = importer.getContacts();
        for (Contact contact : contacts) {
            String username = "";
			try {
				username = new String(contact.getUsername().getBytes("UTF-8"), "GBK");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            System.out.println(username + ": " + contact.getEmail());
        }
    } catch (ContactsException ex) {
      ex.printStackTrace();
    }
}
}