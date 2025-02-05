package io.github.charlie.controller;

import io.github.charlie.base.IDs;
import io.github.charlie.base.Result;
import io.github.charlie.convert.SpecificationConvert;
import io.github.charlie.model.entity.Question;
import io.github.charlie.model.entity.Specification;
import io.github.charlie.model.form.QuestionForm;
import io.github.charlie.model.form.SpecificationForm;
import io.github.charlie.service.SpecificationService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @Author: charlie-zhang-code
 * @Date: 2025/2/5
 * @Description: 规格控制器
 */
@Tag(name = "规格管理")
@RequestMapping("/api/v1/specification")
@RestController
@RequiredArgsConstructor
public class SpecificationController {
    private final SpecificationService service;
    private final SpecificationConvert convert;

    @Operation(summary = "创建规格")
    @PostMapping
    public Result<Boolean> create(@RequestBody SpecificationForm form) {
        Specification entity = convert.toEntity(form);
        entity.setId(null);
        boolean save = service.save(entity);
        return Result.status(save);
    }

    @Operation(summary = "删除规格")
    @DeleteMapping
    public Result<Boolean> delete(@RequestBody IDs iDs) {
        boolean remove = service.removeByIds(iDs.getIds());
        return Result.status(remove);
    }

    @Operation(summary = "修改规格")
    @PutMapping
    public Result<Boolean> update(@RequestBody SpecificationForm form) {
        Specification entity = convert.toEntity(form);
        boolean update = service.updateById(entity);
        return Result.status(update);
    }

    @Operation(summary = "查询规格")
    @GetMapping("/{id}")
    public Result<Specification> get(@PathVariable Long id) {
        Specification entity = service.getById(id);
        return Result.success(entity);
    }
}
