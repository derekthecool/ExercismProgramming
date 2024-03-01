Describe 'HelloWorldTest' {
    BeforeAll {
        . '.\HelloWorld.ps1'
    }
    It "Outputs: 'Hello, World!'" {
        Get-HelloWorld | Should -Be 'Hello, World!'
    }
}
