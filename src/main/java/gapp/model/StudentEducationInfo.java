package gapp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "education_info")
public class StudentEducationInfo implements Serializable {
	
private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue
    @Column(name = "id")
    private Integer educationInfoId;
	
	@Column(name = "college_name")
	private String collegeName;
	
	@Column(name="time_period")
	private String timePeriod;
	
	@Column(name = "degree_earned")
	private String degreeEarned;
	
	private String major;
	
	@ManyToOne	
	private User user;
	
	@ManyToOne
	private Application application;
	
	 private boolean enabled;
	
	
	public Integer getEducationInfoId() {
		return educationInfoId;
	}

	public void setEducationInfoId(Integer educationInfoId) {
		this.educationInfoId = educationInfoId;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getTimePeriod() {
		return timePeriod;
	}

	public void setTimePeriod(String timePeriod) {
		this.timePeriod = timePeriod;
	}

	public String getDegreeEarned() {
		return degreeEarned;
	}

	public void setDegreeEarned(String degreeEarned) {
		this.degreeEarned = degreeEarned;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}	
	
	
}
