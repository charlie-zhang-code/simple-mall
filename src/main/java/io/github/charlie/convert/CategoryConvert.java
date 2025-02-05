package io.github.charlie.convert;

import io.github.charlie.model.entity.Category;
import io.github.charlie.model.form.CategoryForm;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

/**
 * @Author: charlie-zhang-code
 * @Date: 2025/2/5
 * @Description: 类别转换器
 */
@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface CategoryConvert {
    Category toEntity(CategoryForm form);
}
