package custom

import (
	"errors"
	"io"
	"strconv"
	"time"

	"github.com/99designs/gqlgen/graphql"
)

func MarshalDateTime(t time.Time) graphql.Marshaler {
	if t.IsZero() {
		return graphql.Null
	}

	return graphql.WriterFunc(func(w io.Writer) {
		io.WriteString(w, strconv.Quote(t.Format("2006-01-02T15:04:05.000")))
	})
}

func UnmarshalDateTime(v interface{}) (time.Time, error) {
	if tmpStr, ok := v.(string); ok {
		result, err := time.Parse("2006-01-02T15:04:05.000", tmpStr)
		if err == nil {
			return result, err
		}

		result, err = time.Parse("2006-01-02T15:04:05.000Z", tmpStr)
		if err == nil {
			return result, err
		}

		result, err = time.Parse(time.RFC3339, tmpStr)
		if err == nil {
			return result, err
		}

		return result, err
	}
	return time.Time{}, errors.New("time should follow the proper format")
}
