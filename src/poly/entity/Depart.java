package poly.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "Departs")
public class Depart implements Serializable{
	
	@Id
	@Column(name = "Id")
	private String id;
	
	@Column(name = "Name")
	private String name;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "depart")
	private Set<Staff> liStaffs = new HashSet<Staff>();

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

	public Set<Staff> getLiStaffs() {
		return liStaffs;
	}

	public void setLiStaffs(Set<Staff> liStaffs) {
		this.liStaffs = liStaffs;
	}

	@Override
	public String toString() {
		return "Depart [id=" + id + ", name=" + name + "]";
	}
	
	
}
