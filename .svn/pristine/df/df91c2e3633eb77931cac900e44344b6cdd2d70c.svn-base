package gapp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "additionalinfo_records")
public class AdditionalInfoRecords implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer additionalInfoRecordsId;

	private String value;

	private boolean enabled;

	@ManyToOne
	private AdditionalInfo additionalInfo;

	@ManyToOne
	private Application application;

	@ManyToOne
	private User user;

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public Integer getAdditionalInfoRecordsId() {
		return additionalInfoRecordsId;
	}

	public void setAdditionalInfoRecordsId(Integer additionalInfoRecordsId) {
		this.additionalInfoRecordsId = additionalInfoRecordsId;
	}

	public AdditionalInfo getAdditionalInfo() {
		return additionalInfo;
	}

	public void setAdditionalInfo(AdditionalInfo additionalInfo) {
		this.additionalInfo = additionalInfo;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

}
