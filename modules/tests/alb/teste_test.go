package alb

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
)

func TestAlbExample(t *testing.T) {
	opts := &terraform.Options{

		TerraformDir: "../../examples/alb",
	}
	defer terraform.Destroy(t, opts)
	terraform.Init(t, opts)
	terraform.Apply(t, opts)
}
