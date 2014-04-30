<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
<%@  page import="org.json.simple.JSONObject"%>
<%@  page import="org.likelist.type.EC"%>
<%@  page import="org.likelist.type.MailProvider"%>
<%@  page import="com.huangzhimin.contacts.*"%>
<%@  page import="com.huangzhimin.contacts.exception.ContactsException"%>


<%
    request.setCharacterEncoding("utf-8");
    String email = AttrParser.getParaStr(request, "email");
    String password = AttrParser.getParaStr(request, "password");
    String provider = AttrParser.getParaStr(request, "provider");
    
    JSONObject json = new JSONObject();
    try {
        ContactsImporter importer = null;

        if (provider.equals("gmail")) {
        	importer = ContactsImporterFactory
                   .getGmailContacts(email, password);
        } else if (provider.equals("163")) {
            importer = ContactsImporterFactory
                   .getOneSixThreeContacts(email, password);
        } else if (provider.equals("hotmail")) {
            importer = ContactsImporterFactory
                   .getHotmailContacts(email, password);
        } else if (provider.equals("yahoo")) {
            importer = ContactsImporterFactory
                   .getYahooContacts(email, password);
        } else if (provider.equals("")) {
        	importer = null;
        }
        
        json.put("provider", provider);
        List<Contact> contacts = importer.getContacts();
        if (null != contacts) {
            json.put("ec", EC.SUCCESS.toInt());
	        List contactList = new LinkedList();
	        Map oneContact;
	        for (Contact contact : contacts) {
	        	oneContact = new LinkedHashMap();
	        	oneContact.put("email", contact.getEmail());
	        	oneContact.put("userName", contact.getUsername());
	        	contactList.add(oneContact);
	        }
	        json.put("contacts", contactList); 
        } else {
            json.put("ec", EC.UNSUCCESSFUL.toInt());
        }
        
    } catch (ContactsException e) {
        e.printStackTrace();
    }
    
    out.write(json.toJSONString());

        
%>
