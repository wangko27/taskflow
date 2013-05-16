package org.blue.taskflow.domain.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * ͳһ����id��entity����.
 * 
 * ����ͳһ����id���������ơ��������͡�����ӳ�估���ɲ���.
 * ���������getId()�����ض���id������ӳ������ɲ���.
 * 
 * @author blue
 */

@MappedSuperclass
public class IdEntity {
	protected Long id;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //���ݲ�ͬ������ѡȡ��ͬ���������ɹ���
	//@SequenceGenerator(name = "SEQ_TASKFLOW", sequenceName = "SEQ_TASKFLOW", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_TASKFLOW")
	//@Column(name = "ID", nullable = false, length = 19)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return String.valueOf(getId());
	}
}
