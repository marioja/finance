// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mfjassociates.utilities.web.controllers;

import net.mfjassociates.utilities.domain.Address;
import net.mfjassociates.utilities.domain.Client;
import net.mfjassociates.utilities.domain.ContractEngagement;
import net.mfjassociates.utilities.domain.Document;
import net.mfjassociates.utilities.domain.Employee;
import net.mfjassociates.utilities.domain.Invoice;
import net.mfjassociates.utilities.domain.MyCompany;
import net.mfjassociates.utilities.domain.Prefix;
import net.mfjassociates.utilities.web.controllers.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Address, String> ApplicationConversionServiceFactoryBean.getAddressToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.mfjassociates.utilities.domain.Address, java.lang.String>() {
            public String convert(Address address) {
                return new StringBuilder().append(address.getCreated()).append(' ').append(address.getUpdated()).append(' ').append(address.getLine1()).append(' ').append(address.getLine2()).toString();
            }
        };
    }
    
    public Converter<Long, Address> ApplicationConversionServiceFactoryBean.getIdToAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, net.mfjassociates.utilities.domain.Address>() {
            public net.mfjassociates.utilities.domain.Address convert(java.lang.Long id) {
                return Address.findAddress(id);
            }
        };
    }
    
    public Converter<String, Address> ApplicationConversionServiceFactoryBean.getStringToAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.mfjassociates.utilities.domain.Address>() {
            public net.mfjassociates.utilities.domain.Address convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Address.class);
            }
        };
    }
    
    public Converter<Client, String> ApplicationConversionServiceFactoryBean.getClientToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.mfjassociates.utilities.domain.Client, java.lang.String>() {
            public String convert(Client client) {
                return new StringBuilder().append(client.getCompanyName()).append(' ').append(client.getMainTelephoneNumber()).append(' ').append(client.getCreated()).append(' ').append(client.getUpdated()).toString();
            }
        };
    }
    
    public Converter<Long, Client> ApplicationConversionServiceFactoryBean.getIdToClientConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, net.mfjassociates.utilities.domain.Client>() {
            public net.mfjassociates.utilities.domain.Client convert(java.lang.Long id) {
                return Client.findClient(id);
            }
        };
    }
    
    public Converter<String, Client> ApplicationConversionServiceFactoryBean.getStringToClientConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.mfjassociates.utilities.domain.Client>() {
            public net.mfjassociates.utilities.domain.Client convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Client.class);
            }
        };
    }
    
    public Converter<ContractEngagement, String> ApplicationConversionServiceFactoryBean.getContractEngagementToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.mfjassociates.utilities.domain.ContractEngagement, java.lang.String>() {
            public String convert(ContractEngagement contractEngagement) {
                return new StringBuilder().append(contractEngagement.getRate()).toString();
            }
        };
    }
    
    public Converter<Long, ContractEngagement> ApplicationConversionServiceFactoryBean.getIdToContractEngagementConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, net.mfjassociates.utilities.domain.ContractEngagement>() {
            public net.mfjassociates.utilities.domain.ContractEngagement convert(java.lang.Long id) {
                return ContractEngagement.findContractEngagement(id);
            }
        };
    }
    
    public Converter<String, ContractEngagement> ApplicationConversionServiceFactoryBean.getStringToContractEngagementConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.mfjassociates.utilities.domain.ContractEngagement>() {
            public net.mfjassociates.utilities.domain.ContractEngagement convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ContractEngagement.class);
            }
        };
    }
    
    public Converter<Document, String> ApplicationConversionServiceFactoryBean.getDocumentToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.mfjassociates.utilities.domain.Document, java.lang.String>() {
            public String convert(Document document) {
                return new StringBuilder().append(document.getCreated()).append(' ').append(document.getUpdated()).append(' ').append(document.getNumerical()).append(' ').append(document.getDescription()).toString();
            }
        };
    }
    
    public Converter<Long, Document> ApplicationConversionServiceFactoryBean.getIdToDocumentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, net.mfjassociates.utilities.domain.Document>() {
            public net.mfjassociates.utilities.domain.Document convert(java.lang.Long id) {
                return Document.findDocument(id);
            }
        };
    }
    
    public Converter<String, Document> ApplicationConversionServiceFactoryBean.getStringToDocumentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.mfjassociates.utilities.domain.Document>() {
            public net.mfjassociates.utilities.domain.Document convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Document.class);
            }
        };
    }
    
    public Converter<Employee, String> ApplicationConversionServiceFactoryBean.getEmployeeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.mfjassociates.utilities.domain.Employee, java.lang.String>() {
            public String convert(Employee employee) {
                return new StringBuilder().append(employee.getFirstName()).append(' ').append(employee.getLastName()).append(' ').append(employee.getEmail()).toString();
            }
        };
    }
    
    public Converter<Long, Employee> ApplicationConversionServiceFactoryBean.getIdToEmployeeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, net.mfjassociates.utilities.domain.Employee>() {
            public net.mfjassociates.utilities.domain.Employee convert(java.lang.Long id) {
                return Employee.findEmployee(id);
            }
        };
    }
    
    public Converter<String, Employee> ApplicationConversionServiceFactoryBean.getStringToEmployeeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.mfjassociates.utilities.domain.Employee>() {
            public net.mfjassociates.utilities.domain.Employee convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Employee.class);
            }
        };
    }
    
    public Converter<Invoice, String> ApplicationConversionServiceFactoryBean.getInvoiceToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.mfjassociates.utilities.domain.Invoice, java.lang.String>() {
            public String convert(Invoice invoice) {
                return new StringBuilder().append(invoice.getCreated()).append(' ').append(invoice.getUpdated()).append(' ').append(invoice.getInvDate()).append(' ').append(invoice.getDays()).toString();
            }
        };
    }
    
    public Converter<Long, Invoice> ApplicationConversionServiceFactoryBean.getIdToInvoiceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, net.mfjassociates.utilities.domain.Invoice>() {
            public net.mfjassociates.utilities.domain.Invoice convert(java.lang.Long id) {
                return Invoice.findInvoice(id);
            }
        };
    }
    
    public Converter<String, Invoice> ApplicationConversionServiceFactoryBean.getStringToInvoiceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.mfjassociates.utilities.domain.Invoice>() {
            public net.mfjassociates.utilities.domain.Invoice convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Invoice.class);
            }
        };
    }
    
    public Converter<MyCompany, String> ApplicationConversionServiceFactoryBean.getMyCompanyToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.mfjassociates.utilities.domain.MyCompany, java.lang.String>() {
            public String convert(MyCompany myCompany) {
                return new StringBuilder().append(myCompany.getCompanyName()).append(' ').append(myCompany.getMainTelephoneNumber()).append(' ').append(myCompany.getCreated()).append(' ').append(myCompany.getUpdated()).toString();
            }
        };
    }
    
    public Converter<Long, MyCompany> ApplicationConversionServiceFactoryBean.getIdToMyCompanyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, net.mfjassociates.utilities.domain.MyCompany>() {
            public net.mfjassociates.utilities.domain.MyCompany convert(java.lang.Long id) {
                return MyCompany.findMyCompany(id);
            }
        };
    }
    
    public Converter<String, MyCompany> ApplicationConversionServiceFactoryBean.getStringToMyCompanyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.mfjassociates.utilities.domain.MyCompany>() {
            public net.mfjassociates.utilities.domain.MyCompany convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), MyCompany.class);
            }
        };
    }
    
    public Converter<Prefix, String> ApplicationConversionServiceFactoryBean.getPrefixToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.mfjassociates.utilities.domain.Prefix, java.lang.String>() {
            public String convert(Prefix prefix) {
                return new StringBuilder().append(prefix.getCreated()).append(' ').append(prefix.getUpdated()).append(' ').append(prefix.getCode()).toString();
            }
        };
    }
    
    public Converter<Long, Prefix> ApplicationConversionServiceFactoryBean.getIdToPrefixConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, net.mfjassociates.utilities.domain.Prefix>() {
            public net.mfjassociates.utilities.domain.Prefix convert(java.lang.Long id) {
                return Prefix.findPrefix(id);
            }
        };
    }
    
    public Converter<String, Prefix> ApplicationConversionServiceFactoryBean.getStringToPrefixConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.mfjassociates.utilities.domain.Prefix>() {
            public net.mfjassociates.utilities.domain.Prefix convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Prefix.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getAddressToStringConverter());
        registry.addConverter(getIdToAddressConverter());
        registry.addConverter(getStringToAddressConverter());
        registry.addConverter(getClientToStringConverter());
        registry.addConverter(getIdToClientConverter());
        registry.addConverter(getStringToClientConverter());
        registry.addConverter(getContractEngagementToStringConverter());
        registry.addConverter(getIdToContractEngagementConverter());
        registry.addConverter(getStringToContractEngagementConverter());
        registry.addConverter(getDocumentToStringConverter());
        registry.addConverter(getIdToDocumentConverter());
        registry.addConverter(getStringToDocumentConverter());
        registry.addConverter(getEmployeeToStringConverter());
        registry.addConverter(getIdToEmployeeConverter());
        registry.addConverter(getStringToEmployeeConverter());
        registry.addConverter(getInvoiceToStringConverter());
        registry.addConverter(getIdToInvoiceConverter());
        registry.addConverter(getStringToInvoiceConverter());
        registry.addConverter(getMyCompanyToStringConverter());
        registry.addConverter(getIdToMyCompanyConverter());
        registry.addConverter(getStringToMyCompanyConverter());
        registry.addConverter(getPrefixToStringConverter());
        registry.addConverter(getIdToPrefixConverter());
        registry.addConverter(getStringToPrefixConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
