package org.blue.taskflow.domain.dao;

import java.util.Collection;
import java.util.Iterator;

import org.springframework.util.Assert;
import org.blue.taskflow.domain.entity.IdEntity;
import org.springside.modules.utils.reflection.ReflectionUtils;

/**
 * ������Ŀ��Hibernate������.
 *
 * @author calvin
 */
public class HibernateUtils {

	/**
	 * ���ݶ���ID����, ����ϲ�����.
	 *
	 * ҳ�淢�ͱ������Ӷ���id�б�ʱ,��Hibernate��ɾ������ԭ�����Ӷ��󼯺��ٸ���ҳ��id�б���һ��ȫ�µļ������ֿ�����򵥵������ǲ��е�.
	 * ��˲�����˵������㷨����Դ������ɾ��id����Ŀ�꼯���еĶ���,����Ŀ�꼯���е�id����������ӵ�Դ������.
	 * ��Ϊ�½�����ֻ��ID����ֵ, ��˱��������ʺ���cascade-save-or-update�Զ��־û��Ӷ��������.
	 *
	 * @param srcObjects Դ����,Ԫ��Ϊ����.
	 * @param checkedIds  Ŀ�꼯��,Ԫ��ΪID.
	 * @param clazz  �����ж��������,����ΪIdEntity����
	 */
	public static <T extends IdEntity> void mergeByCheckedIds(final Collection<T> srcObjects,
			final Collection<Long> checkedIds, final Class<T> clazz) {

		//����У��
		Assert.notNull(srcObjects, "scrObjects����Ϊ��");
		Assert.notNull(clazz, "clazz����Ϊ��");

		//Ŀ�꼯��Ϊ��, ɾ��Դ���������ж����ֱ�ӷ���.
		if (checkedIds == null) {
			srcObjects.clear();
			return;
		}

		//����Դ���󼯺�,�����id����Ŀ��ID�����еĶ���ɾ��.
		//ͬʱ,��Ŀ�꼯����ɾ������Դ�����е�id,ʹ��Ŀ�꼯����ʣ�µ�id��ΪԴ������û�е�id.
		Iterator<T> srcIterator = srcObjects.iterator();
		try {

			while (srcIterator.hasNext()) {
				T element = srcIterator.next();
				Long id = element.getId();

				if (!checkedIds.contains(id)) {
					srcIterator.remove();
				} else {
					checkedIds.remove(id);
				}
			}

			//ID����Ŀǰʣ���id������Դ������,��������,Ϊid���Ը�ֵ����ӵ�Դ������.
			for (Long id : checkedIds) {
				T element = clazz.newInstance();
				element.setId(id);
				srcObjects.add(element);
			}
		} catch (Exception e) {
			throw ReflectionUtils.convertReflectionExceptionToUnchecked(e);
		}
	}
}