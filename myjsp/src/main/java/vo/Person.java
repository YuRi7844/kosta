package vo;

import java.io.Serializable;

public class Person implements Serializable{
	private String name;
	private int age;
	private double tall;
	private boolean marriage;
	public Person() {
		super();
	}
	public Person(String name, int age, double tall, boolean marriage) {
		super();
		this.name = name;
		this.age = age;
		this.tall = tall;
		this.marriage = marriage;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public double getTall() {
		return tall;
	}
	public void setTall(double tall) {
		this.tall = tall;
	}
	public boolean isMarriage() {
		return marriage;
	}
	public void setMarriage(boolean marriage) {
		this.marriage = marriage;
	}
	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + ", tall=" + tall + ", marriage=" + marriage + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + age;
		result = prime * result + (marriage ? 1231 : 1237);
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		long temp;
		temp = Double.doubleToLongBits(tall);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Person other = (Person) obj;
		if (age != other.age)
			return false;
		if (marriage != other.marriage)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (Double.doubleToLongBits(tall) != Double.doubleToLongBits(other.tall))
			return false;
		return true;
	}
}
