package gapp.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "additional_info")
public class AdditionalInfo implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue
    @Column(name = "id")
    private Integer additionalInfoId;
	
	@ManyToOne
	private Department dept;
	
	private String name;
	
	@Column(name = "field_type")
	private String fieldType;
    
	private boolean required;
	
	@ManyToOne    
    private User staff;
    
    @Column(name="created_on")
    private Date createdOn;
    
    private boolean enabled;

	public Integer getAdditionalInfoId() {
		return additionalInfoId;
	}

	public void setAdditionalInfoId(Integer additionalInfoId) {
		this.additionalInfoId = additionalInfoId;
	}

	
	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public boolean isRequired() {
		return required;
	}

	public void setRequired(boolean required) {
		this.required = required;
	}

	public User getStaff() {
		return staff;
	}

	public void setStaff(User staff) {
		this.staff = staff;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	
}
