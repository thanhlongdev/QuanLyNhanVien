package poly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.FetchType;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@SuppressWarnings("serial")
@Entity
@Table(name = "Staffs")
public class Staff implements Serializable{
	
	@Id
	@Column(name = "Id")
	private String id;
	
	@Column(name = "Name")
	private String name;
	
	@Column(name = "Gender")
	private boolean gender;
	
	@Column(name = "Birthday")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date birthday;
	
	@Column(name = "Photo")
	private String photo;
	
	@Column(name = "Email")
	private String email;
	
	@Column(name = "Phone")
	private String phone;
	
	@Column(name = "Salary")
	private float slary;
	
	@Column(name = "Notes",nullable = true)
	private String note;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "DepartId", nullable = false)
	private Depart depart;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "staff")
	private Set<Record> listRecords = new HashSet<Record>();

	public Staff() {
		// TODO Auto-generated constructor stub
	}
	
	public Staff(String id, String name, boolean gender, Date birthday, String photo, String email, String phone,
			float slary, String note, Depart depart) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.photo = photo;
		this.email = email;
		this.phone = phone;
		this.slary = slary;
		this.note = note;
		this.depart = depart;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public float getSlary() {
		return slary;
	}

	public void setSlary(float slary) {
		this.slary = slary;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Depart getDepart() {
		return depart;
	}

	public void setDepart(Depart depart) {
		this.depart = depart;
	}

	public Set<Record> getListRecords() {
		return listRecords;
	}

	public void setListRecords(Set<Record> listRecords) {
		this.listRecords = listRecords;
	}

	@Override
	public String toString() {
		return "Staff [id=" + id + ", name=" + name + ", gender=" + gender + ", birthday=" + birthday + ", photo="
				+ photo + ", email=" + email + ", phone=" + phone + ", slary=" + slary + ", note=" + note + ", depart="
				+ depart + "]";
	}
}
