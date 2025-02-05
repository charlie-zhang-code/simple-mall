package io.github.charlie.convert;

import io.github.charlie.model.entity.Specification;
import io.github.charlie.model.form.SpecificationForm;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

/**
 * @Author: charlie-zhang-code
 * @Date: 2025/2/5
 * @Description: 规格转换器
 */
@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface SpecificationConvert {
    Specification toEntity(SpecificationForm form);
}
