# Maven构建

## maven生命周期
[官方文档](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)

基本的生命周期
- 验证（validate） - 验证项目是否正确，所有必要的信息可用
- 编译（compile） - 编译项目的源代码
- 测试（test） - 使用合适的单元测试框架测试编译的源代码。这些测试不应该要求代码被打包或部署
- 打包（package） - 采用编译的代码，并以其可分配格式（如JAR）进行打包。
- 验证（verify） - 对集成测试的结果执行任何检查，以确保满足质量标准
- 安装（install） - 将软件包安装到本地存储库中，用作本地其他项目的依赖项
- 部署（deploy） - 在构建环境中完成，将最终的包复制到远程存储库以与其他开发人员和项目共享。