package sample.batch;

import javax.batch.api.chunk.ItemProcessor;
import javax.inject.Named;

@Named("sample.batch.SampleProcessor")
public class SampleProcessor implements ItemProcessor {

	public SampleProcessor() {
		// TODO Auto-generated constructor stub
		System.out.println("[SampleProcessor] SampleProcessor()");
	}

	@Override
	public Object processItem(Object arg0) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("[SampleProcessor] processItem() " + arg0);
		// return null;
		return arg0;
	}

}
