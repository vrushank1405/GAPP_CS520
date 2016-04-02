package gapp.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "applications")
public class Application implements Serializable {
	
private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue
    @Column(name = "id")
    private Integer applicationId;
	
	
	@OneToOne	
	private DepartmentProgram program;
	
	@OneToOne
	private ProgramTerm term;
	
	@ManyToOne
	private User user;
	
	@OneToOne(mappedBy = "application")
	private Student student;
	
	@OneToMany(mappedBy = "application")
	private List<StudentEducationInfo> studentEducationInfo;
	
	@OneToMany(mappedBy = "application")
	private List<AdditionalInfoRecords> additionalInfoRecords;
	
	@OneToOne	
	private Status status;
	
	private Boolean international;
	
	@Column(nullable = true)
	private Integer toefl;	
	
	@Column(name = "gpa")
	private double GPA;
	
	private String transcript;
	
	private Boolean submit;

	@Column(name="created_on")
	private Date createdOn;
	
	 private boolean enabled;

	
	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Integer getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(Integer applicationId) {
		this.applicationId = applicationId;
	}

	public DepartmentProgram getProgram() {
		return program;
	}

	public void setProgram(DepartmentProgram program) {
		this.program = program;
	}
	
	public ProgramTerm getTerm() {
		return term;
	}

	public void setTerm(ProgramTerm term) {
		this.term = term;
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


	public Integer getToefl() {
		return toefl;
	}

	public void setToefl(Integer toefl) {
		this.toefl = toefl;
	}

	public double getGPA() {
		return GPA;
	}

	public void setGPA(double gPA) {
		GPA = gPA;
	}

	public String getTranscript() {
		return transcript;
	}

	public void setTranscript(String transcript) {
		this.transcript = transcript;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Boolean getInternational() {
		return international;
	}

	public void setInternational(Boolean international) {
		this.international = international;
	}

	public Boolean getSubmit() {
		return submit;
	}

	public void setSubmit(Boolean submit) {
		this.submit = submit;
	}
	

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public List<StudentEducationInfo> getStudentEducationInfo() {
		return studentEducationInfo;
	}

	public void setStudentEducationInfo(
			List<StudentEducationInfo> studentEducationInfo) {
		this.studentEducationInfo = studentEducationInfo;
	}

	public List<AdditionalInfoRecords> getAdditionalInfoRecords() {
		return additionalInfoRecords;
	}

	public void setAdditionalInfoRecords(
			List<AdditionalInfoRecords> additionalInfoRecords) {
		this.additionalInfoRecords = additionalInfoRecords;
	}



}
